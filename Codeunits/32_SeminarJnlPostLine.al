codeunit 123456732 "CSD Seminar Jnl.-Post Line"

{
    TableNo = "CSD Seminar Journal Line";
    trigger OnRun();
    begin
        RunWithCheck(Rec);
    end;
    
    var
        SeminarJnlLine:Record "CSD Seminar Journal Line";
        SeminarLedgerEntry:Record "CSD Seminar Ledger Entry";
        SeminarRegister:Record "CSD Seminar Register";
        SeminarJnlCheckLine:Codeunit "CSD Seminar Jnl.-Check Line";
        CurrEntryNo:Integer;

    procedure Code();
    begin
        with SeminarJnlLine do begin
            if EmptyLine then
                exit;
            SeminarJnlCheckLine.RunCheck(SeminarJnlLine);
            if CurrEntryNo = 0 then begin
                SeminarLedgerEntry.LockTable;
                if SeminarLedgerEntry.FindLast then
                    CurrEntryNo := SeminarLedgerEntry."Entry No." ;
                CurrEntryNo += 1;
            end;
            if "Document Date" = 0D then
                "Document Date" := "Posting Date";
            if SeminarRegister."No." = 0 then begin
                SeminarRegister.LockTable;
                if (not SeminarRegister.FindLast) or (SeminarRegister."To Entry No." <> 0) then begin
                    SeminarRegister.Init;
                    SeminarRegister."No." += 1;
                    SeminarRegister."From Entry No." := CurrEntryNo;
                    SeminarRegister."To Entry No." := CurrEntryNo;
                    SeminarRegister."Creation Date" := Today;
                    SeminarRegister."Source Code" := "Source Code";
                    SeminarRegister."Journal Batch Name" := "Journal Batch Name";
                    SeminarRegister."User ID" := UserId;
                    SeminarRegister.Insert(true);
                end;
            end;
            SeminarRegister."To Entry No." := CurrEntryNo;
            SeminarRegister.Modify(true);

            SeminarLedgerEntry.Init;
            SeminarLedgerEntry."Seminar No." := "Seminar No.";
            SeminarLedgerEntry."Posting Date" := "Posting Date";
            SeminarLedgerEntry."Document Date" := "Document Date";
            SeminarLedgerEntry."Entry Type" := "Entry Type";
            SeminarLedgerEntry."Document No." := "Document No.";
            SeminarLedgerEntry.Description := Description;
            SeminarLedgerEntry."Bill-to Customer No." := "Bill-to Customer No.";
            SeminarLedgerEntry."Charge Type" := "Charge Type";
            SeminarLedgerEntry.Type := Type;
            SeminarLedgerEntry.Quantity := Quantity;
            SeminarLedgerEntry."Unit Price" := "Unit Price";
            SeminarLedgerEntry."Total Price" := "Total Price";
            SeminarLedgerEntry."Participant Contact No." := "Participant Contact No.";
            SeminarLedgerEntry."Participant Name" := "Participant Name";
            SeminarLedgerEntry.Chargeable := Chargeable;
            SeminarLedgerEntry."Room Resource No." := "Room Resource No.";
            SeminarLedgerEntry."Instructor Resource No." := "Instructor Resource No.";
            SeminarLedgerEntry."Starting Date" := "Starting Date";
            SeminarLedgerEntry."Seminar Registration No." := "Seminar Registration No.";
            SeminarLedgerEntry."Res. Ledger Entry No." := "Res. Ledger Entry No.";
            SeminarLedgerEntry."Source Type" := "Source Type";
            SeminarLedgerEntry."Source No." := "Source No.";
            SeminarLedgerEntry."Journal Batch Name" := "Journal Batch Name";
            SeminarLedgerEntry."Source Code" := "Source Code";
            SeminarLedgerEntry."Reason Code" := "Reason Code";
            SeminarLedgerEntry."Posting No. Series" := "Posting No. Series";
        end;
    end;

    procedure RunWithCheck(var SeminarJnlLine2:Record "CSD Seminar Journal Line");
    begin
        SeminarJnlLine := SeminarJnlLine2;
        Code();
        SeminarJnlLine2 := SeminarJnlLine;
    end;
}