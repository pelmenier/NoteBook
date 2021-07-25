<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NoteBookWebForms._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>NoteBook</h1>     
    </div>
<div id="vue">
    <div>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>№</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="c in ContactsData">
                    <td>{{c.ContactID}}</td>
                    <td>{{c.Name}}</td>
                    <td>{{c.Email}}</td>
                    <td>{{c.Mobile}}</td>
                    <td><a href="#" v-on:click="openEditForm(c)"><span class="glyphicon glyphicon-edit"></span></a></td>
                    <td><a href="#" v-on:click="removeContact(c.ContactID)" onClick="window.location.reload()"><span class="glyphicon glyphicon-remove"></span></a></td>    
                    
                </tr>
            </tbody>
        </table>
        <div v-if="!state">
            <button v-on:click.prevent="openForm">new contact</button>
        </div>
        <div v-if="state">
            <form>
                <span>Name:</span>
                <input type="text" v-model="form.contactName"/>
                <hr />
                <span>Email:</span>
                <input type="text" v-model="form.contactEmail"/>
                <hr />
                <span>Mobile:</span>
                <input type="text" v-model="form.contactMobile" />
                <hr />
                <div v-if="!editFlag">
                    <button type="submit" class="btn btn-outline-success" @click="addContact">Add</button>
                </div>
                <div v-if="editFlag">
                    <button type="submit" class="btn btn-outline-success" @click="editContact">Edit</button>
                </div>
            </form>
        </div>       
    </div>
</div> 

    <script type="text/javascript">   

        var app = new Vue({
            el: '#vue',

            data: {
                state: false,
                editFlag: false,
                contactId: '№',

                form: {
                    contactId: '',
                    contactName: '',
                    contactEmail: '',
                    contactMobile: ''
                },             

                ContactsData: null
            },

            mounted: function() {
                this.getContacts();
            },

            methods: {
                getContacts: function () {
                    axios
                        .get('http://localhost:64617/api/Contact')
                        .then(response => (this.ContactsData = response.data))
                        .catch(error => console.log(error));
                },

                addContact: function () {                    
                    axios.post('http://localhost:64617/api/addContact', {
                        'Name': this.form.contactName,
                        'Email': this.form.contactEmail,
                        'Mobile': this.form.contactMobile
                    }),
                        this.state = false;
                    console.log("add");
                },

                editContact: function () {                    
                    axios.post('http://localhost:64617/api/editContact', {     
                        'ContactID': this.form.contactId,
                        'Name': this.form.contactName,
                        'Email': this.form.contactEmail,
                        'Mobile': this.form.contactMobile
                    }).then((response) => console.log(response));
                    this.editFlag = false;
                    this.state = false;
                    console.log("edit");
                },

                openEditForm: function (contact) {
                    this.state = true;
                    this.editFlag = true;
                    this.form.contactId = contact.ContactID,
                    this.form.contactName = contact.Name,
                    this.form.contactEmail = contact.Email,
                    this.form.contactMobile = contact.Mobile
                },

                removeContact: function (id) {                    
                    axios.post('http://localhost:64617/api/Contact/' + id, {
                        
                    }).then((response) => console.log(response));             
                },

                openForm: function () {
                    this.state = true;                    
                }
            }
        });
    </script>
</asp:Content>
