import { LightningElement ,api} from 'lwc';

export default class LifeCycleHooksChildComponent extends LightningElement {

    @api itemName="Child salesforce name";

    @api handleChangeName(){
      this.itemName="Changed child item name";
    }
    //constructor(){
        
        //console.log(" Child constructor is called");
        
    //}
    //connectedCallback(){
     //   console.log(" Child connectedCallback is called");
    //}


    //renderedCallback(){
    //    console.log(" Child renderedCallback is called");
    //}

    //disconnectedCallback(){
      //  console.log(" Child disconnectedCallback is called");
    //}
}