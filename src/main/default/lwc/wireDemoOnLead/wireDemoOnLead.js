import { LightningElement , wire, track } from 'lwc';
import getLeadList from '@salesforce/apex/WireDemoOnLeads.getLeadList';

const Columns = [
    { label :'Lead Name ',fieldName :'Name'},
    { label :'Lead ID',fieldName :'Id'},
    { label :'Lead Status',fieldName :'Status'},

];

export default class WireDemoOnLead extends LightningElement {

    @track data=[];
    @track columns=Columns;

    @wire(getLeadList)
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