public class exampleCon1 {
public Account acc{get;set;}
Integer count = 0;
public PageReference incrementCounter() {
count++;
return null;
}
public Integer getCount() {
return count;
}
}