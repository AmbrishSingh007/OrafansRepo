public class treenodes {

/* Wrapper class to contain the nodes and their children */
public class cNodes
{

 public List<Account > parent {get; set;}
 Public Account gparent {get;set;}

 public cNodes(Account  gp, List<Account > p)
 {
     parent = p;
     gparent = gp;
 }
}
/* end of Wrapper class */ 

Public List<cNodes> hierarchy;

Public List<cNodes> getmainnodes()
{
    hierarchy = new List<cNodes>();
    List<Account> tempparent = [Select Id,Name from Account where ParentId=null and Name=:'Ambrish123'];
    for (Integer i =0; i< tempparent.size() ; i++)
    {
        List<Account> tempparent1 = [Select Id,Name from Account where ParentId=:tempparent[i].id];
        hierarchy.add(new cNodes(tempparent[i],tempparent1));
        for (Integer j =0; j< tempparent1.size() ; j++)
        {
            hierarchy.add(new cNodes(tempparent1[j],[Select Id,Name from Account where ParentId=:tempparent1[j].id]));
        }
     }   
     System.debug('-----'+hierarchy);
    return hierarchy;
}   
}