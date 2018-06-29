codeunit 123456731 "CSD Seminar Jnl.-Check Line"
//Seminar Journal Check Line codeunit
{
    TableNo = "CSD Seminar Journal Line";
    trigger OnRun();
    begin
        RunCheck(Rec);
    end;
    
    var
        GLSetup:Record "General Ledger Setup";
        UserSetup:Record "User Setup";
        AllowPostingFrom:Date;
        AllowPostingTo:Date;
        TxtErrOnClosingDate:Label 'Trying to post on closing date';
        TxtErrOutsidePostingPer:Label 'Trying to post outside the allowed posting periods';

    procedure RunCheck(var SeminarJnlLine:Record "CSD Seminar Journal Line");
    var
        
    begin
        with SeminarJnlLine do begin
            if EmptyLine then
                exit;
            TestField("Posting Date");
            TestField("Seminar No.");
            case "Charge Type" of
                "Charge Type"::Instructor:
                    TestField("Instructor Resource No.");
                "Charge Type"::Participant:
                    TestField("Participant Contact No.");
                "Charge Type"::Room:
                    TestField("Room Resource No.");
            end;
            if Chargeable then
                TestField("Bill-to Customer No.");
            if "Posting Date" = ClosingDate("Posting Date") then 
                Error(TxtErrOnClosingDate);
            if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                if UserId <> '' then
                    if UserSetup.Get(UserId) then begin
                        if (UserSetup."Allow Posting From" = 0D) or (UserSetup."Allow Posting To" = 0D) then begin
                            GLSetup.Get();
                            GLSetup.TestField("Allow Posting From");
                            GLSetup.TestField("Allow Posting To");
                            AllowPostingFrom := GLSetup."Allow Posting From";
                            AllowPostingTo := GLSetup."Allow Posting To";
                        end
                        else begin
                            AllowPostingFrom := UserSetup."Allow Posting From";
                            AllowPostingTo := UserSetup."Allow Posting To";
                        end;
                    end;
            end;
            if AllowPostingTo = 0D then
                AllowPostingTo := DMY2Date(31,12,9999);
            if not CheckIfDateAllowed("Posting Date") then
                Error(TxtErrOutsidePostingPer);
            if "Document Date" <> 0D then
                if "Document Date" = ClosingDate("Document Date") then
                    Error(TxtErrOnClosingDate);
        end;
    end;

    procedure CheckIfDateAllowed(PostingDate:Date):Boolean;
    begin
        if (PostingDate <= AllowPostingTo) and (PostingDate >= AllowPostingFrom) then
            exit(true)
        else
            exit(false);
    end;
}