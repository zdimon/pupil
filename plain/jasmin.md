##Jasmin testing

###Downloading

    https://github.com/jasmine/jasmine/releases    

    <script>

        hello = function(){
            return 'hello world'
        };


        describe("Hello world", function()
            {
                it("say hello", function()
                     {
                        expect(hello()).toEqual('hello world');
                     }
                   )
            }
        );


    </script>
    
    
describe("Hello world"... is what we call a suite. 
This is basically a component of your application; this could be a class or just a slew of functions.    


it() - is called a spec. 


toEqual() - matcher.

    toBe() ===

    toEqual() ==

    toMatch() - regular expression

        expect(value).toMatch('welcome')

    toContain()
    
    toDefined() - compares value against undefined.
    toUndefined()
    toBeNull()

    toBeTruthy()
    toBeFalsy()

    toBeLessThan()
    toBeGreaterThan()


    toBeCloseTo(30,0)
    
    toThrow()
    
    
###Custom matcher

    describe('Test', function(){
            this.addMatchers({ 'name': function(expected) { 
                        return this.actual >= expected;
                    } 
            })
        }        
    );
    

###Before/after each

    beforeEach(func)
    afterEach(func)


    beforeEach(
        function(){
            var name = 'hello world';
        }
    );



### Testing


        beforeEach(function () {
            browser.get('index.html#/login');
        });


        it('should then be.', function () {
            browser().navigateTo('/login');

            var username = input('username').enter('steph');
            console.log(username);
            input('password').enter('steph');
            element('#login').click();

            expect(browser().location().url()).toBe("/index");

            expect(element('#user').text()).toEqual('steph');

        });

    });


    
    
    
    
