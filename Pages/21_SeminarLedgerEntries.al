page 123456721 "CSD Seminar Ledger Entries"
//Created new page for displaying Seminar Ledger Entries
//Seriously, how much more of these will we need to do?!

//added navigate action
{
    PageType = List;
    SourceTable = "CSD Seminar Ledger Entry";
    Caption = 'Seminar Ledger Entries';
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Posting Date";"Posting Date") {}
                field("Document No.";"Document No.") {}
                field("Document Date";"Document Date") 
                {
                    Visible = false;
                }
                field("Entry Type";"Entry Type") {}
                field("Seminar No.";"Seminar No.") {}
                field(Description;Description) {}
                field("Bill-to Customer No.";"Bill-to Customer No.") {}
                field("Charge Type";"Charge Type") {}
                field(Type;Type) {}
                field(Quantity;Quantity) {}
                field("Participant Contact No.";"Participant Contact No.") {}
                field("Participant Name";"Participant Name") {}
                field("Instructor Resource No.";"Instructor Resource No.") {}
                field("Room Resource No.";"Room Resource No.") {}
                field("Starting Date";"Starting Date") {}
                field("Seminar Registration No.";"Seminar Registration No.") {}
                field("Entry No.";"Entry No.") {}
            }
        }
        area(factboxes)
        {
            systempart("Links";Links)
            {

            }
            systempart("Notes";Notes)
            {

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("&Navigate")
            {
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction();
                var
                    Navigate : Page Navigate;
                begin
                    Navigate.SetDoc("Posting Date", "Document No.");
                    Navigate.Run;
                end;
            }
        }
    }
}