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
                    <th>{{contactId}}</th>
                    <th>{{contactName}}</th>
                    <th>{{contactEmail}}</th>
                    <th>{{contactMobile}}</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="c in ContactsData">
                    <td>{{c.ContactID}}</td>
                    <td>{{c.Name}}</td>
                    <td>{{c.Email}}</td>
                    <td>{{c.Mobile}}</td>
                    <td><a href="#" v-on:click="editContact"><span class="glyphicon glyphicon-edit"></span></a>
                        <a href="#" v-on:click="removeContact"><span class="glyphicon glyphicon-remove"></span></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">new contact</button>
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h4 class="modal-title">Create new contact</h4>
                    </div>
                    <div class="modal-body">
                        <div>Name</div>
                        <input type="text" />
                        <div>Email</div>
                        <input type="text" />
                        <div>Mobile</div>
                        <input type="text" />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success">Create</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>    
</div>

    <script type="text/javascript">
        var app = new Vue({
            el: '#vue',

            data: {
                contactId: '№',
                contactName: 'Name',
                contactEmail: 'Email',
                contactMobile: 'Mobile',

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
                    alert('contact add!');
                },

                editContact: function () {                    
                    alert('form edit open!');
                },

                removeContact: function () {
                    alert('contact remove!');
                }
            }
        });
    </script>
</asp:Content>
