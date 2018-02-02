#coding: utf-8
*** Settings ***
Documentation    Usage: "pybot mytest.robot§ ."
Library          OperatingSystem
Library          Collections
Library          String
Library          robotlib/MavenLibrary.py
Suite Setup      Setup everything

*** Variables ***
${MAVEN_ARTIFACT}   com.example:examplelibrary:0.1.0

*** Test Cases ***
Login library is loaded
    Create User   fred    P4ssw0rd

User can fetch maven artifacts
    Fetch Maven Artifact    ${MAVEN_ARTIFACT}    tmp.jar
    # ArchiveLibrary can optionally be used to unzip the artifact

*** Keywords ***

Setup everything
    BuiltIn.Import Library  ${CURDIR}/robotlib/LoginLibrary.py
