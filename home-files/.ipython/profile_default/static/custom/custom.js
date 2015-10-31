// leave at least 2 line with only a star on it below, or doc generation fails
/**
 *
 *
 * Placeholder for custom user javascript
 * mainly to be overridden in profile/static/custom/custom.js
 * This will always be an empty file in IPython
 *
 * User could add any javascript in the `profile/static/custom/custom.js` file.
 * It will be executed by the ipython notebook at load time.
 *
 * Same thing with `profile/static/custom/custom.css` to inject custom css into the notebook.
 *
 *
 * The object available at load time depend on the version of IPython in use.
 * there is no guaranties of API stability.
 *
 * The example below explain the principle, and might not be valid.
 *
 * Instances are created after the loading of this file and might need to be accessed using events:
 *     define([
 *        'base/js/namespace',
 *        'base/js/events'
 *     ], function(IPython, events) {
 *         events.on("app_initialized.NotebookApp", function () {
 *             IPython.keyboard_manager....
 *         });
 *     });
 *
 * __Example 1:__
 *
 * Create a custom button in toolbar that execute `%qtconsole` in kernel
 * and hence open a qtconsole attached to the same kernel as the current notebook
 *
 *    define([
 *        'base/js/namespace',
 *        'base/js/events'
 *    ], function(IPython, events) {
 *        events.on('app_initialized.NotebookApp', function(){
 *            IPython.toolbar.add_buttons_group([
 *                {
 *                    'label'   : 'run qtconsole',
 *                    'icon'    : 'icon-terminal', // select your icon from http://fortawesome.github.io/Font-Awesome/icons
 *                    'callback': function () {
 *                        IPython.notebook.kernel.execute('%qtconsole')
 *                    }
 *                }
 *                // add more button here if needed.
 *                ]);
 *        });
 *    });
 *
 * __Example 2:__
 *
 * At the completion of the dashboard loading, load an unofficial javascript extension
 * that is installed in profile/static/custom/
 *
 *    define([
 *        'base/js/events'
 *    ], function(events) {
 *        events.on('app_initialized.DashboardApp', function(){
 *            require(['custom/unofficial_extension.js'])
 *        });
 *    });
 *
 * __Example 3:__
 *
 *  Use `jQuery.getScript(url [, success(script, textStatus, jqXHR)] );`
 *  to load custom script into the notebook.
 *
 *    // to load the metadata ui extension example.
 *    $.getScript('/static/notebook/js/celltoolbarpresets/example.js');
 *    // or
 *    // to load the metadata ui extension to control slideshow mode / reveal js for nbconvert
 *    $.getScript('/static/notebook/js/celltoolbarpresets/slideshow.js');
 *
 *
 * @module IPython
 * @namespace IPython
 * @class customjs
 * @static
 */

var CollapseManager=function(){
    function get_visibilities(){
        var vis_array=[];
        var inner_cells=$('body').find('div.inner_cell');
        if (!inner_cells || !inner_cells.length) return [];

        for (var i=0; i<inner_cells.length; i++){
            vis_array.push($(inner_cells[i]).is(':visible')); 
        }
        return vis_array.join(',');
    }

    function set_visibilities(str){
        if (!str) return;
        var arr=str.split(',')
        var inner_cells=$('body').find('div.inner_cell');
        if (!inner_cells || !inner_cells.length) return;

        var len=Math.min(arr.length, inner_cells.length);
        for (var i=0; i<len; i++){
            if (arr[i]=="false"){
                $(inner_cells[i]).hide();
            }
            else {
                $(inner_cells[i]).show();
            }
        }
    }

    function save_visibilities(){
        var v=get_visibilities();
        //console.log("save: "+v);
        window.localStorage.setItem('vis-'+window.location.href, v);
    }

    function restore_visibilities(){
        var v=window.localStorage.getItem('vis-'+window.location.href);
        //console.log("restore: "+v);
        set_visibilities(v);
    }
    
    function  add_toggle_input() {
//                $('.input_prompt')
//                    .css('cursor','default')
//                    .css('position','relative')
//                    .css('min-height','20px')
//                    .css('border','1px solid #ddd')
//                    .css('margin-right','4px')
//                    .off('click')
//                    .on('click',function(e){$(this).siblings().toggle();});
        
        try { $('.input>span.vi-00').remove();} catch(e){}
        $('.input')
            .css('position','relative')
            .css('min-height','20px')
            .append($('<span class="vi-00">+</span>')
                .css('position','absolute')
                .css('left',-4)
                //.css('color','silver')
                .css('width','20px')
                .css('height','20px')
                .css('padding','0')
                .css('cursor','pointer')
                .on('click',function(e){
                  $(this).parent().find('div.inner_cell').toggle();
                  save_visibilities();
                }));
    };

    return {
        saveState: save_visibilities,
        restoreState: restore_visibilities,
        getState: get_visibilities,
        setState: set_visibilities,
        addButton: add_toggle_input 
    };
}();



define([
    'base/js/namespace',
    'base/js/events'
    ], 
    function(IPython, events) {
        events.on("app_initialized.NotebookApp", 
            function () {
                //IPython.Cell.options_default.cm_config.lineNumbers = true;
                //IPython.Cell.options_default.cm_config.vimMode = true;
            }
        );
        events.on("notebook_loaded.Notebook", function(){
            CollapseManager.addButton();
            CollapseManager.restoreState();
          }
        );
        events.on("create.Cell", function(){
            CollapseManager.addButton();
          }
        );
        events.on("before_save.Notebook", function(){
            CollapseManager.saveState();
          }
        );
    }
);

//add theme selector
if (Jupyter) {
  $(Jupyter.events).on("app_initialized.NotebookApp", function() {

    var utils = require("base/js/utils");
    utils.load_extensions('theme_selector');
  });

} else {
  $([IPython.events]).on("app_initialized.NotebookApp", function() {
    IPython.load_extensions('theme_selector');
  });
}
