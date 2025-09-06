import { LightningElement , wire, track} from 'lwc';
import getAccountList from '@salesforce/apex/wireDemoOnAccounts.getAccountList';

const columns = [
    { label :'Account Name ',fieldName :'Name'},
    { label :'Account ID',fieldName :'Id'},
    { label :'Phone',fieldName :'Phone'},
];

export default class WireDemoComponent extends LightningElement {

    @track data=[];
    @track columns=columns;

    @wire(getAccountList)

    wiredData({error,data}) {
        if(data){
            this.data=data;
        }
        else if(error)
        {
            console.log('error occured');
        }
    }
}