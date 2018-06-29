page 123456702 "CSD Seminar List"
{
    PageType = List;
    SourceTable = "CSD Seminar";
    CardPageId = "CSD Seminar Card";
    Editable = false;
    Caption = 'Seminar List';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    
                }
                field(Name;Name)
                {
                    
                }
                field("Seminar Duration";"Seminar Duration")
                {
                    
                }
                field("Seminar Price";"Seminar Price")
                {
                    
                }
                field("Minimum Participants";"Minimum Participants")
                {
                    
                }
                field("Maximum Participants";"Maximum Participants")
                {
                    
                }
            }
        }
        area(FactBoxes)
        {
            systempart("Links";Links)
            {

            }
            systempart(Notes;Notes)
            {

            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Seminar")
            {
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    RunObject=page "CSD Seminar Comment Sheet";
                    RunPageLink = "Table Name" = const(Seminar), "No." = field("No.");
                    Image = Comment;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                }
                action("Ledger Entries")
                {
                    Caption = 'Ledger Entries';
                    RunObject=page "CSD Seminar Ledger Entries";
                    RunPageLink = "Seminar No." = field("No.");
                    Image = WarrantyLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortcutKey = "Ctrl + F7";
                }
                action("&Registrations")
                {
                    Caption = '&Registrations';
                    RunObject=page "CSD Seminar Registration List";
                    RunPageLink = "Seminar No." = field("No.");
                    Image = Timesheet;
                    Promoted = true;
                    PromotedCategory = Process;
                }
            }
            
        }
        area(Processing)
        {
            action("Seminar Registration")
            {
                Caption = 'New Seminar Registration';
                RunObject=page "CSD Seminar Registration";
                RunPageLink = "Seminar No." = field("No.");
                RunPageMode = Create;
                Image = NewTimesheet;
                Promoted = true;
                PromotedCategory = New;
            }
        }
    }
}