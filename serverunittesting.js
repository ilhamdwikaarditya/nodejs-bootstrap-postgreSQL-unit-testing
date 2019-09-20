var expect  = require('chai').expect;
var request = require('request');

it('Main page status', function(done) {
    request('http://localhost:8080' , function(error, response, body) {
        expect(response.statusCode).to.equal(200);
        done();
    });
});

describe('Status content', function() {
    describe ('Main page', function() {
        it('status homepage', function(done){
            request('http://localhost:8000/', function(error, response, body) {
                expect(response.statusCode).to.equal(200);
                done();
            });
        });

        it('status kategori', function(done) {
            request('http://localhost:8000/kategori' , function(error, response, body) {
               expect(response.statusCode).to.equal(200);
                done();
            });
        });
		
		it('status api kategori', function(done) {
            request('http://localhost:8000/api/kategori' , function(error, response, body) {
                expect(response.statusCode).to.equal(200);
                done();
            });
        });
    });
});