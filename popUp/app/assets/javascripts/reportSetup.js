

window.onload = function(){

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
            var target = build + sql;
            window.location = (target);
        }
    
    });

}