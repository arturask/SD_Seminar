page 123456707 "CSD Seminar Comment List"
{
    PageType = List;
    SourceTable = "CSD Seminar Comment Line";
    Caption = 'Seminar Comment List';
    UsageCategory = Tasks;
    Editable = false;

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
}