module.exports = function(app)
{
    app.get('/',function(req,res){ //localhost:3000 = '/'
        res.render('page.html');
    });

    app.get('/attendance.html',function(req,res){
        res.render('attendance.html');
    });
	
	app.get('/contract.html',function(req,res){
        res.render('contract.html');
    });

    app.get('/manager.html',function(req,res){
        res.render('manager.html');
    });

    app.get('/notification.html',function(req,res){
        res.render('notification.html');
    });

    app.get('/site_registration.html',function(req,res){
        res.render('site_registration.html');
    });

    app.get('/site_show.html',function(req,res){
        res.render('site_show.html');
    });

    app.get('/token.html',function(req,res){
        res.render('token.html');
    });
}