public class TestRecursion {
    public static String str='';
    public void verify(integer i){
        System.debug('---'+str);
        i--;
        str+='Ambrish';
        if(i>=0)
            verify(i);
        
    }
    public void main(){
        System.debug('---'+str);
        verify(5);
        System.debug('---'+str);
    }

}