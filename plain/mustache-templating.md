##Mustache templating

http://coenraets.org/blog/2011/12/tutorial-html-templates-with-mustache-js/


        var messages = [
            {userName: 'Dima', datePosted: '2016-01-01', messageText:'hello'},
            {userName: 'Vova Putin', datePosted: '2016-01-02', messageText:'HI'}
        ];

        $.each(messages, function(index, message) {
            $('#messageList').append(
                '<li><span class="list-title">' +
                message.userName + '</span>' +
                '<abbr class="list-timestamp" title="' +
                message.datePosted + '"></abbr>' +
                '<p class="list-text">' + message.messageText + '</p></li>');
            }
        ); 

###Downside.

Tight coupling of UI and data (hard to reuse and maintain).

###Solutions.

  Query Templates, Underscore.js, and Mustache.js.

Mustache is a “logic-less” template syntax. It doesn’t rely on procedural statements (if, else, for, etc).
  


        var messages = [
            {userName: 'Dima', datePosted: '2016-01-01', messageText:'hello'},
            {userName: 'Vova Putin', datePosted: '2016-01-02', messageText:'HI'}
        ];

        var template = "<li><b>{{userName}}</b>: {{messageText}}</li>";

        $.each(messages, function(index, message) {
                var html = Mustache.to_html(template, message);
                $('#messageList').append(html);
            }
        ); 

###Externalized template


        <script id="messageTpl" type="text/template">
            <li>{{userName}} : {{datePosted}} : {{messageText}}</li>
        </script>


        var template = $('#messageTpl').html();
            
### Enumerable section with object

    var data = {
        employees: [
        {   firstName: "Christophe",
            lastName: "Coenraets"},
        {   firstName: "John",
            lastName: "Smith"}
        ]};
    var template = "Employees:<ul>{{#employees}}" +
                                "<li>{{firstName}} {{lastName}}</li>" +
                                "{{/employees}}</ul>";
    var html = Mustache.to_html(template, data);
    $('#messageList').html(html);

### Enumerable section with list


        var data = {name: "Dimitry the Imposter", skills: ['JavaScript', 'PHP', 'Python']};
        var tpl = "<li>{{name}} skills:<ul>{{#skills}}<li>{{.}}</li>{{/skills}}</ul>";
        var html = Mustache.to_html(tpl, data);
        $('#messageList').append(html);


###Nested Objects.

    var person = {
        firstName: "Christophe",
        lastName: "Coenraets",
        blogURL: "http://coenraets.org",
        manager : {
            firstName: "John",
            lastName: "Smith"
        }
    };
    var template = "<h1>{{firstName}} {{lastName}}</h1><p>{{blogURL}}</p>" +
                   "Manager: {{manager.firstName}} {{manager.lastName}}";
    var html = Mustache.to_html(template, person);
    $('#sampleArea').html(html);



    var tpl = "<h1>{{firstName}} {{lastName}}</h1><p>{{blogURL}}</p>" +
              "{{#manager}}Manager: {{firstName}} {{lastName}}{{/manager}}";


###Function


    var product = {
        name: "FooBar",
        price: 100,
        salesTax: 0.05,
        totalPrice: function() {
            return this.price + this.price * this.salesTax;
        }
    };
    var template = "<p>Product Name: {{name}}</p>Price: {{totalPrice}}";
    var html = Mustache.to_html(template, product);
    $('#sampleArea').html(html);

###Condition

    var data = {
        employees: [
        {   firstName: "Christophe",
            lastName: "Coenraets",
            fullTime: true,
            phone: "617-123-4567"
        },
        {   firstName: "John",
            lastName: "Smith",
            fullTime: false,
            phone: "617-987-6543"
        },
        {   firstName: "Lisa",
            lastName: "Jones",
            fullTime: true,
            phone: "617-111-2323"
        },
        ]};
    var tpl = "Employees:<ul>{{#employees}}<li>{{firstName}} {{lastName}}" +
              "{{#fullTime}} {{phone}}{{/fullTime}}</li>{{/employees}}</ul>";
    var html = Mustache.to_html(tpl, data);
    $('#sampleArea').html(html);


###Partials

    var data = {
        firstName: "Christophe",
        lastName: "Coenraets",
        address: "1 Main street",
        city: "Boston",
        state: "MA",
        zip: "02106"
    };
     
    var template = "<h1>{{firstName}} {{lastName}}</h1>{{>address}}";
    var partials = {address: "<p>{{address}}</p>{{city}}, {{state}} {{zip}}"};
    var html = Mustache.to_html(template, data, partials);
    $('#sampleArea').html(html);



