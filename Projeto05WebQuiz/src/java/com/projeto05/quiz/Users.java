package com.projeto05.quiz;

public class Users {

    private String name;
    private int userTestsCount;
    private double userTestsGradeSum;
    private double userLastGrade;
    private int userType;

    public Users(String name, int userTestsCount, double userTestsGradeSum, double userLastGrade,int userType) {
        this.name = name;
        this.userTestsCount = userTestsCount;
        this.userTestsGradeSum = userTestsGradeSum;
        this.userLastGrade = userLastGrade;
        this.userType = userType;
    }

    public double getUserLastGrade() {
        return userLastGrade;
    }

    public void setUserLastGrade(double usersLastGrade) {
        this.userLastGrade = usersLastGrade;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getUserTestsCount() {
        return userTestsCount;
    }

    public void setUserTestsCount(int userTestsCount) {
        this.userTestsCount = userTestsCount;
    }

    public double getUserTestsGradeSum() {
        return userTestsGradeSum;
    }

    public void setUserTestsGradeSum(double usersTestsGradeSum) {
        this.userTestsGradeSum += usersTestsGradeSum;
    }

    public double getUserGradeAverage() {
        return userTestsGradeSum / (double) userTestsCount;
    }

    public int getUserType() {
        return userType;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }

}
