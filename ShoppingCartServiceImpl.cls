public class ShoppingCartServiceImpl implements IShoppingCartService{
    @TestVisible
    private static PurchaseOrderSelector pos=new PurchaseOrderSelector();
    @TestVisible
    private static ProductSelector ps=new ProductSelector();
    @TestVisible 
    private static fflib_ISObjectUnitOfWork uow1 = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] {
        PurchaseOrder__c.SObjectType
    });
    @TestVisible 
    private static fflib_ISObjectUnitOfWork uow2 = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] {
        Purchase_Order_Line_Item__c.SObjectType
    });
    public List<PurchaseOrder__c> getPurchaseHistory(){
        return pos.getAllPurchaseOrder();
    }
    public List<Product2> getAllProduct(){
        return ps.getAllProduct();
    }
    public List<Product2> selectById(List<ID> idSet){
        return ps.selectById(idSet);
    }
    public Id insertPurchase(Integer total){
        PurchaseOrder__c po=new PurchaseOrder__c(Status__c='Processing',Order_Date__c=Date.today(),Order_Total__c=total);
        uow1.registerNew(po);
        uow1.commitWork();
        return po.Id;
    }
    public void insertPurchaseLineItem(Id purchaseId,List< Map<String,Object> > productItem){
        //List<Purchase_Order_Line_Item__c> poli=new List< Purchase_Order_Line_Item__c >();
        for(Map<String,Object> li:productItem){
            uow2.registerNew(new Purchase_Order_Line_Item__c(Product__c=(Id)li.get('Id'),PurchaseOrder__c=purchaseId,Unit__c=(Integer)li.get('Unit')));
        }
        //insert poli;
        uow2.commitWork();
    }
}
