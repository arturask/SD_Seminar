page 123456722 "CSD Seminar Registers"
//more documentation.
//version 6.66 - The Edgy edition
{
    PageType = List;
    SourceTable = "CSD Seminar Register";
    Caption = 'Seminar Registers';
    Editable = false;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.") {}
                field("Creation Date";"Creation Date") {}
                field("User ID";"User ID") {}
                field("Source Code";"Source Code") {}
                field("Journal Batch Name";"Journal Batch Name") {}
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
        area(Navigation)
        {
            action(SeminarLedgers)
            {
                Caption = 'Seminar Ledgers';
                Image = WarrantyLedger;
                RunObject = codeunit "CSD Seminar Reg.-Show Ledger";

            }
        }
    }
}