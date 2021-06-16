module.exports = function(app)
{
    app.get('/',function(req,res){ //localhost:3000 = '/'
        res.render('page.html');
    });

    app.get('/attendance',function(req,res){
        res.render('attendance.html');
    });
	
	app.get('/contract',function(req,res){
        res.render('contract.html');
    });

    app.get('/manager',function(req,res){
        res.render('manager.html');
    });

    app.get('/notification',function(req,res){
        res.render('notification.html');
    });

    app.get('/site_registration',function(req,res){
        res.render('site_registration.html');
    });

    app.get('/site_show',function(req,res){
        res.render('site_show.html');
    });

    app.get('/token',function(req,res){
        res.render('token.html');
    });
}