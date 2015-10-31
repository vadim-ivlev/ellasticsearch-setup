# =======================================================================
# version by Nicholas Bollweg
# https://gist.github.com/bollwyvl/de3b4ca8b6ed8bb28f86



# -*- coding: ascii -*-
from __future__ import print_function

# A Coffeescript magic for IPython

from pygments import highlight
from pygments.lexers import JavascriptLexer
from pygments.formatters import HtmlFormatter

from IPython import display
from IPython.core.magic import (
    register_cell_magic,
    Magics,
    magics_class,
    cell_magic,
)
from IPython.core.magic_arguments import (
    argument,
    magic_arguments,
    parse_argstring,
)

import coffeescript

@magics_class
class CoffeescriptMagics(Magics):
    '''
    Write and execute Coffeescript in the IPython Notebook
    
    Example:
    
        %%coffeescript
        class Foo
            constructor: ->
                @bar = "baz"
    '''
    
    def __init__(self, shell):
        self.lexer = JavascriptLexer()
        super(CoffeescriptMagics, self).__init__(shell)
    
    @cell_magic
    @magic_arguments()
    @argument("-b", "--bare", default=False, action="store_true",
              help="Return the compiled code without wrapping in an IIFE.")
    @argument("-v", "--verbose", default=False, action="store_true",
              help="Show generated javascript")
    def coffeescript(self, line, cell):
        opts = parse_argstring(self.coffeescript, line)
        try:
            src = coffeescript.compile(cell, bare=opts.bare)
            if opts.verbose:
                pretty = highlight(src, self.lexer, HtmlFormatter(full=True))
                return display.HTML("%s<script>%s</script>" % (pretty, src))
            return display.HTML("<script>%s</script>" % src)
            #return display.Javascript(src)
        except Exception as err:
            print(err)

def load_ipython_extension(ip):
    ip = get_ipython()
    ip.register_magics(CoffeescriptMagics)

ip = get_ipython()
ip.register_magics(CoffeescriptMagics)
# =======================================================================




##my version
#from IPython.core.magic import register_cell_magic
#                                
#@register_cell_magic
#def coffeescript(options_text, cell_text):
#    """The %%coffeescript cell magic function.
#    """
#    # import locally to NOT stick with old objects
#    # after %reload_ext coffeetools
#    from coffeetools import coffee, CoffeeError
#    from IPython.display import display, Javascript
#    try:
#        javascript = coffee.compile(cell_text)
#    except CoffeeError as e:
#        print e
#        #sys.stderr.write(str(e))
#        #sys.stderr.flush()
#    else:
#        print(javascript)
#        display(Javascript(javascript))
#        #print(javascript)
#    #return options_text, cell_text
#
#del coffeescript
#
