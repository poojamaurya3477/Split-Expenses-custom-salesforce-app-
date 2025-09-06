import { LightningElement } from 'lwc';

export default class LifeCycleHooksExamples extends LightningElement {


    handleClick(){
        this.template.querySelector("c-life-cycle-hooks-child-component").handleChangeName();
    }

    constructor(){
        super();
        console.log("constructor is called");

    }
    connectedCallback(){
        console.log("connectedCallback is called");
    }


    renderedCallback(){
        console.log("renderedCallback is called");
    }
    //check these in browser console
        //constructor is called
        //connectedCallback is called
        //Child constructor is called
        //Child connectedCallback is called
        // Child renderedCallback is called
        //renderedCallback is called

   // error callback is only called on parent component when there is error on child component-- received when removed the super from child.

    errorCallback(){
        console.log("errorCallback is called");
    }
}