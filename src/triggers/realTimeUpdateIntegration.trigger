trigger realTimeUpdateIntegration  on Account (after update) {
    System.debug('---Trigger Started');
    AccountUpdateIntegration.runJob('orafans999@gmail.com','alteclansing1950','Sync','DSS');

    /* 
    Type of task or taskflow. Use one of the following options:
    DLS. Data Loader task.
    DSS. Data Synchronization task.
    DRS. Data Replication task.
    DQA. Data Assessment task.
    PCS. PowerCenter task.
    DNB. D&B360 batch.
    Workflow. Task flow.
    */
}