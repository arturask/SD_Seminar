codeunit 123456739 "CSD Event Subscriptions"
//Added event subscriber to put new module fields into standard ledger entries
{
    trigger OnRun();
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, 212, 'OnBeforeResLedgEntryInsert', '', true, true)]
    procedure PostResJnlLineOnBeforeResLedgEntryInsert(ResLedgerEntry: Record "Res. Ledger Entry"; ResJournalLine: Record "Res. Journal Line");
    var

    begin
        ResLedgerEntry."CSD Seminar No." := ResJournalLine."CSD Seminar No.";
        ResLedgerEntry."CSD Seminar Registration No." := ResJournalLine."CSD Seminar Registration No.";
    end;

    [EventSubscriber(ObjectType::Page, 344, 'OnAfterNavigateFindRecords', '', false, false)]
    procedure ExtendNavigateOnAfterNavigateFindRecords(var DocumentEntry:Record "Document Entry"; DocNoFilter:Text; PostingDateFilter:Text);
    var
        SeminarLedgerEntry : Record "CSD Seminar Ledger Entry";
        PostedSeminarRegHeader : Record "CSD Posted Sem. Reg. Header";
        DocNoOfRecords : Integer;
        NextEntryNo : Integer;
    begin
        if PostedSeminarRegHeader.ReadPermission then begin
            PostedSeminarRegHeader.Reset;
            PostedSeminarRegHeader.setfilter("No.", DocNoFilter);
            PostedSeminarRegHeader.SetFilter("Posting Date", PostingDateFilter);
            DocNoOfRecords := PostedSeminarRegHeader.Count;
            if DocNoOfRecords <> 0 then 
                with DocumentEntry do begin
                    Init;
                    NextEntryNo += 1;
                    "Entry No." := NextEntryNo;
                    "Table ID" := Database::"CSD Posted Sem. Reg. Header";
                    "Document Type" := 0;
                    "Table Name" := PostedSeminarRegHeader.TableName;
                    "No. of Records" := DocNoOfRecords;
                    Insert(true);
                end;
        end;
        if SeminarLedgerEntry.ReadPermission then begin
            SeminarLedgerEntry.Reset;
            SeminarLedgerEntry.setfilter("Document No.", DocNoFilter);
            SeminarLedgerEntry.SetFilter("Posting Date", PostingDateFilter);
            DocNoOfRecords := SeminarLedgerEntry.Count;
            if DocNoOfRecords <> 0 then 
                with DocumentEntry do begin
                    Init;
                    NextEntryNo += 1;
                    "Entry No." := NextEntryNo;
                    "Table ID" := Database::"CSD Seminar Ledger Entry";
                    "Document Type" := 0;
                    "Table Name" := SeminarLedgerEntry.TableName;
                    "No. of Records" := DocNoOfRecords;
                    Insert(true);
                end;
        end;

    end;

    [EventSubscriber(ObjectType::Page, 344, 'OnAfterNavigateShowRecords', '', false, false)]
    procedure ExtendNavigateOnAfterNavigateShowRecords(TableID : Integer; DocNoFilter : Text; PostingDateFilter : Text; ItemTrackingSearch : Boolean);
    var
        SeminarLedgerEntry : Record "CSD Seminar Ledger Entry";
        PostedSeminarRegHeader : Record "CSD Posted Sem. Reg. Header";
    begin
        case TableID of
            Database::"CSD Posted Sem. Reg. Header":
                Page.Run(0,PostedSeminarRegHeader);
            Database::"CSD Seminar Ledger Entry":
                Page.Run(0,SeminarLedgerEntry);
        end;
    end;
}