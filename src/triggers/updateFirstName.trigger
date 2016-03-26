trigger updateFirstName on Contact (before insert) {
    for(Contact c:trigger.new){
        c.Firstname='Ambrish';
    }

}