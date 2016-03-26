public class exampleCon {
    Integer count = 0;
                        
    public PageReference incrementCounter() {
            count++;
            return null;
    }
                    
    public Integer getCount() {
        return count;
    }
}


/***  Controller:
                        
public class exampleCon {
    public exampleCon(){
    enable=true;
    }
    Integer count = 0;
    public Boolean enable{set;get;}
                        
    public PageReference incrementCounter() {
        count++;
        if(count==2)
            enable=false;
        return null;
    }
                        
    public Integer getCount() {
        return count;
    }
}
*/