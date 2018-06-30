report 123456701 "CSD Seminar Participant List"
{
    Caption = 'Seminar Reg.-Participant List';
    DefaultLayout = RDLC;
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/Report 123456701.rdlc';
    dataset
    {
        dataitem(SeminarRegHeader; "CSD Seminar Reg. Header")
        {
            DataItemTableView = sorting ("No.");
            RequestFilterFields = "No.", "Seminar No.";
            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(SeminarNo; "Seminar No.")
            {
                IncludeCaption = true;
            }
            column(SeminarName; "Seminar Name")
            {
                IncludeCaption = true;
            }
            column(StartingDate; "Starting Date")
            {
                IncludeCaption = true;
            }
            column(Duration; Duration)
            {
                IncludeCaption = true;
            }
            column(InstructorName; "Instructor Name")
            {
                IncludeCaption = true;
            }
            column(RoomName; "Room Name")
            {
                IncludeCaption = true;
            }
            dataitem(SeminarRegLine; "CSD Seminar Registration Line")
            {
                DataItemTableView = sorting ("Document No.", "Line No.");
                DataItemLink = "Document No."=field("No.");
                column(BillToCustomerNo; "Bill-to Customer No.")
                {
                    IncludeCaption = true;
                }
                column(ParticipantContactNo; "Participant Contact No.")
                {
                    IncludeCaption = true;
                }
                column(ParticipantName; "Participant Name")
                {
                    IncludeCaption = true;
                }
            }
            trigger OnPostDataItem();
            begin
                SeminarRegHeader.IncrementNoPrinted();
            end;
        }
        dataitem("Company Information";"Company Information")
        {
            column(CompanyName;Name)
            {

            }
        }
    }
    labels
    {
        SeminarRegistrationHeaderCap = 'Seminar Registration List';
    }
    
    /*
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(Name;SourceExpression)
                    {
                    }
                }
            }
        }
    
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                }
            }
        }
    }
    */
    
    var
        myInt : Integer;
}