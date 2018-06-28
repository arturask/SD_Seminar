table 123456701 "CSD Seminar"
//Lab 5.2
{
    DataClassification = ToBeClassified;
    Caption = 'Seminar Setup';
    LookupPageId = "CSD Seminar List";
    DrillDownPageId = "CSD Seminar List";
    
    fields
    {
        field(10;"No.";Code[10])
        {
            Caption = 'No.';
            trigger OnValidate();
            begin
                if Rec."No." <> xRec."No." then begin
                    SeminarSetup.Get;
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(20;"Name";Text[50])
        {
            Caption = 'Name';
            trigger OnValidate();
            begin
                if (UpperCase(Rec.Name) <> (UpperCase(xRec.Name))) then
                    validate("Search Name", UpperCase(Name));
            end;
        }
        field(30;"Seminar Duration";Decimal)
        {
            Caption = 'Seminar Duration';
            DecimalPlaces = 0:1;
        }
        field(40;"Minimum Participants";Integer)
        {
            Caption = 'Minimum Participants';
         }
        field(50;"Maximum Participants";Integer)
        {
            Caption = 'Maximum Participants';
         }
        field(60;"Search Name";Code[50])
        {
            Caption = 'Search Name';
        }
        field(70;"Blocked";Boolean)
        {
            Caption = 'Blocked';
        }
        field(80;"Last Date Modified";Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(90;"Comment";Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula=exist("CSD Seminar Comment Line" where("Table Name" = const("Seminar"), "No."=field("No.")));
        }
        field(100;"Seminar Price";Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 1;
        }
        field(110;"Gen. Prod. Posting Group";Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
            trigger OnValidate();
            begin
                if Rec."Gen. Prod. Posting Group" <> xRec."Gen. Prod. Posting Group" then begin
                    GenProdPostingGroup.Get("Gen. Prod. Posting Group");
                    if GenProdPostingGroup.ValidateVatProdPostingGroup(GenProdPostingGroup,"Gen. Prod. Posting Group") then
                        validate("VAT Prod. Posting Group", GenProdPostingGroup."Def. VAT Prod. Posting Group");
                end;
            end;
        }
        field(120;"VAT Prod. Posting Group";Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(130;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }

    }

    keys
    {
        key(PK;"No.")
        {
            Clustered = true;
        }
        key(Key1;"Search Name")
        {

        }
    }
    var
        SeminarSetup:Record "CSD Seminar Setup";
        //SeminarCommentLine:Record "CSD Seminar Comment Line";
        GenProdPostingGroup:Record "Gen. Product Posting Group";
        NoSeriesMgt:Codeunit NoSeriesManagement;
        Seminar:Record "CSD Seminar";

    trigger OnInsert();
    begin
        if "No." = '' then begin
            SeminarSetup.Get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.",xRec."No. Series",0D,"No.","No. Series");
        end;

    end;

    trigger OnModify();
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnRename();
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnDelete();
    begin
        /*
        Clear(SeminarCommentLine);
        SeminarCommentLine.setrange("Table Name", SeminarCommentLine."Table Name"::Seminar);
        SeminarCommentLine.setrange("No.", "No.");
        SeminarCommentLine.deleteall;
        */
    end;

    procedure AssistEdit() : Boolean;
    begin
        with Seminar do begin
            Seminar := Rec;
            SeminarSetup.Get;
            SeminarSetup.TestField("Seminar Nos.");
            if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.", xRec."No. Series","No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                Rec := Seminar;
                exit(true);
            end;
        end;
    end;
    
}