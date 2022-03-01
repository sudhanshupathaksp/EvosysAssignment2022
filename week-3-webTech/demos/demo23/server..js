import Book from './book.js';
import express from 'express';
//const express = require('express');
//const book = require('./book');

const server = express();

const books = [];
books.push(new Book('Book2','Author2','12346'));
books.push(new Book('Book3','Author3','12347'));
books.push(new Book('Book4','Author4','12348'));

//GET http://localhost:3000/books

server.get("/books",(req,res)=>{
    res.setHeader('Content-Type','application/json');
    res.send(books);
});

//GET http://localhost:3000/books/:isbn

server.get("/books/:isbn",(req,res)=>{
    res.setHeader('Content-Type','application/json');
    const book = books.find(b=>b.isbn===req.params.isbn);
    if(book){
        res.send(book);
    }else{
        req.status(404).send('Book not found');
    }
});

server.listen(3000,()=>{
    console.log('Server started on port 3000');
});