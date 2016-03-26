public class Student{
public String name{set;get;}
public Integer id{set;get;}
public String hobby{set;get;}
public Decimal marks{set;get;}
String msg;
public Student(Integer id,String name,Decimal marks){
    this.id=id;
    this.name=name;
    this.marks=marks;
}
public void myPerformance(){
    if(marks<40)
        msg='Failed';
    else if(marks>90)
        msg='Distinction';
    else
        msg='Passed';
}
}