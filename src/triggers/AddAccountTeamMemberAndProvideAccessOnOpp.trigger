trigger AddAccountTeamMemberAndProvideAccessOnOpp on Account (after insert)//,after update,after delete
{
List<AccountTeamMember> acctMembers = new List<AccountTeamMember>();
List<AccountShare> acctSharingRules = new List<AccountShare>();
for(Account acc : trigger.new)
{
AccountTeamMember ca = new AccountTeamMember();
ca.AccountId = acc.Id;
ca.TeamMemberRole = 'Account Manager';
ca.UserId = acc.TeamMember__c;
acctMembers.add(ca);
insert acctMembers;

AccountShare caSharingRule =[select id,AccountAccessLevel,OpportunityAccessLevel,CaseAccessLevel,ContactAccessLevel from AccountShare where AccountId=:acc.Id] ;//new AccountShare(Accountid=acc.id);
// caSharingRule.AccountId = acc.Id;
caSharingRule.AccountAccessLevel = 'All';
caSharingRule.OpportunityAccessLevel = 'Read';
caSharingRule.CaseAccessLevel = 'Edit';
caSharingRule.ContactAccessLevel = 'Edit';
acctSharingRules.add(caSharingRule);
update acctSharingRules;

}

}