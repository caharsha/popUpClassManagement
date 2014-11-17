
$(function(){

    console.log("load");

    $('#queryButton').click( function(e){
    
        console.log("Click");
        
        var sql = $('#query').val();
    
        console.log(sql);
        
        
        if( sql!=null && sql!=""){
            var existingUrl = document.URL;
            var segments = existingUrl.split('/');
            var build = "";
            for( var i = 0; i < segments.length; ++i ){
                build = build + segments[i] + '/';
                if( segments[i] == "reports") break;
            }
            
            var space = sql.split( " ");
            sql = "";
            for( var i = 0; i < space.length; ++i){
                sql = sql + space[i];
                if( i != space.length - 1)
                    sql = sql + '-';
            }
            
            var target = build + sql;
            
            window.location = (target);
        }
    
    });

});