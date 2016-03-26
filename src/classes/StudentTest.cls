@isTest
class StudentTest{
    static testMethod void unitTest1(){
        Student s=new Student(1,'Ambrish',40);
        s.myPerformance();
        
    }
    static testMethod void unitTest2(){
        Student s=new Student(1,'Ambrish',39);
        s.myPerformance();
        
        s=new Student(1,'Ambrish',95);
        s.myPerformance();
        
        s=new Student(1,'Ambrish',50);
        s.myPerformance();
    }
    static testMethod void unitTest3(){
    Student s=new Student(100,'Ambrish',100);
    s.hobby='Coding';    
    }
    
}