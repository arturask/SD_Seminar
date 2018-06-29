page 123456706 "CSD Seminar Comment Sheet"
{
    PageType = List;
    SourceTable = "CSD Seminar Comment Line";
    Caption = 'Seminar Comment Sheet';
    UsageCategory = Tasks;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Date";"Date")
                {
                    
                }
                field("Code";"Code")
                {
                    Visible = false;
                }
                field("Comment";"Comment")
                {
                    
                }
            }
        }
        area(factboxes)
        {
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        SetupNewLine;
    end;
}