package com.quiz.model;

// Model class representing a quiz attempt
public class Attempt {
    private int attemptId;
    private int userId;
    private int score;
    private String attemptDesc;

    // Default constructor
    public Attempt() {}

    // Constructor with all fields
    public Attempt(int attemptId, int userId, int score, String attemptDesc) {
        this.attemptId = attemptId;
        this.userId = userId;
        this.score = score;
        this.attemptDesc = attemptDesc;
    }

    // Getters and Setters
    public int getAttemptId() 
    { 
        return attemptId; 
        
    }
    public void setAttemptId(int attemptId) 
    { 
        this.attemptId = attemptId; 
        
    }
    public int getUserId() 
    {
         return userId; 
    
    }
    public void setUserId(int userId) 
    {
         this.userId = userId; 
    
    }
    public int getScore() 
    { 
        return score; 
    
    }
    public void setScore(int score) 
    { 
        this.score = score; 
    }
    public String getAttemptDesc() 
    {
         return attemptDesc; 
    }
    public void setAttemptDesc(String attemptDesc) 
    {
         this.attemptDesc = attemptDesc; 
    }
}