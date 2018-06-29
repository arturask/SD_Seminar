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
}