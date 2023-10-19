const isNgrok = false;
const tomcatCodeString = "e030-82-84-59-44";
const erlangUrlNumber = "0";
const erlangPort = "15472";
const fetchUrl = isNgrok ? `http://${tomcatCodeString}.ngrok-free.app/app` : `http://localhost:8080/app`;
const webSocketUrl = isNgrok ? `ws://${erlangUrlNumber}.tcp.eu.ngrok.io:${erlangPort}` : `ws://localhost:8081`;
