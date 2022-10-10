@isTest
class PurchaseOrderSelectorTest {

    @isTest

    static void testGetAllPurchaseOrder(){

        //Given
        List<PurchaseOrder__c> poList=new List<PurchaseOrder__c>();
        for(Integer i=1;i<=10;i++){
            PurchaseOrder__c po=new PurchaseOrder__C(Order_Date__c=Date.today(),Order_Total__c=100);
            poList.add(po);
        }
        insert poList;
        List<PurchaseOrder__c> pos;

        //When
        test.startTest();
            pos=new PurchaseOrderSelector().getAllPurchaseOrder();
        test.stopTest();

        //Then
        System.assertEquals(10, pos.size(),'Get All Purchase Order History');
    }
    @isTest
    static void getSObjectFieldList(){
        system.assertEquals(3, new PurchaseOrderSelector().getSObjectFieldList().size(),'Return the list of field');
    }

    @isTest
    static void getSObjectType(){
        system.assertEquals(PurchaseOrder__c.sObjectType, new PurchaseOrderSelector().getSObjectType(),'Return the Type of Object');
    }
}
