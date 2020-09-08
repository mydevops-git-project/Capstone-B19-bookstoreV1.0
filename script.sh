ls /DevOps/workspace/DevOpsCapstone/Bazinga/devops/ilp1/ILP/0.0.1-SNAPSHOT/*.war | tail -1 | xargs cp -t /DevOps/
mv  /DevOps/*.war /DevOps/ansible/ILP_Bookstore.war
\rm -rf /DevOps/workspace/DevOpsCapstone/Bazinga/devops/ilp1/ILP/0.0.1-SNAPSHOT/*
