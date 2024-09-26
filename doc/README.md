# alteryx Lift & Shift in Commercial Subscription 
1.  Create collections in Alteryx for LOB FieldOps and add all the alteryx workflow to collection: FieldOps.
2. Access the Virtual Machine spun-up for the Alteryx Controller, Alteryx worker's (3 nodes), MongosDB Master, Mongo Slave nodes (2 node).
3. Access newly created samba/Chandler in Azure which contain users files like (.yxdbs and csv files). This should mimic the samba shares currently in atg
4. Create [DBports](https://jira.viasat.com/browse/GB-8569) for the Source/Target Databases which are currently used by Alteryx users ( this may take time to open up ports for the Outbound). Gather all the DB's required Alteryx Outbound
5. Install Mongo DB on the MongoDB Server and MongoDB Databases for Alteryx on the Controller.
`mongodb://alteryxController:*****@10.64.5.43:27017`
6. Create or Add IDP credentials (SAML authentication).
7. Install Alteryx Server on Controller and follow the prerequisites for the Alteryx installation. Check for Licenses.
8. Validate the services for Alteryx and Mongo DB are running on all the servers:
    
        Name             ResourceGroup        Location    Zones
        ---------------  -------------------  ----------  -------
        vmgtatxadmgdev   rg-Alteryx-LnS-1654  eastus
        vmgtatxctrlrdev  rg-Alteryx-LnS-1654  eastus --> Alteryx Controller
        vmgtatxwrkr1dev  rg-Alteryx-LnS-1654  eastus --> Alteryx Worker1
        vmgtatxwrkr2dev  rg-Alteryx-LnS-1654  eastus --> Alteryx Worker2
        vmgtatxwrkr3dev  rg-Alteryx-LnS-1654  eastus --> Alteryx Worker3
        vmgtmongodb1dev  rg-Alteryx-LnS-1654  eastus --> MongoDB Master
        vmgtmongodb2dev  rg-Alteryx-LnS-1654  eastus --> MongoDB Slave1
        vmgtmongodb3dev  rg-Alteryx-LnS-1654  eastus --> MongoDB Slave2
        vmgtpblcsmbadev  rg-Alteryx-LnS-1654  eastus --> Azure Public Samba
        vmgtprvtsmbadev  rg-Alteryx-LnS-1654  eastus --> Azure Private Samba

### Alteryx Server Installation 
- There are 4 server nodes- 1 Virtual Machine for Alteryx Controller and remaining 3 VM's for the Gallery workers 1, 2, 3. 
- Download the Alteryx Installation files [Alteryx Server (2021.2)](https://alteryx.flexnetoperations.com/flexnet/operationsportal/entitledDownloadFile.action?downloadPkgId=Alteryx+Server+%282021.2%29&orgId=OG-22414)
- Log into Controller VM and Admin Install Alteryx Server (2021.2)

### Mongo Database

- Install MongoDB for Alteryx Metadata usage `MongoDB Master`


