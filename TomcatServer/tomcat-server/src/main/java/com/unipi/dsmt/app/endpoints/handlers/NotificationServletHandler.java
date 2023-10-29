package com.unipi.dsmt.app.endpoints.handlers;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Timestamp;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.unipi.dsmt.app.dtos.NotificationUnpackDTO;

import jakarta.servlet.http.HttpServletRequest;

public class NotificationServletHandler {
  public static NotificationUnpackDTO unpackPostNotification(HttpServletRequest request)
      throws IOException {
    BufferedReader bodyReader = new BufferedReader(new InputStreamReader(request.getInputStream()));
    StringBuilder body = new StringBuilder();
    String bodyLine;
    while ((bodyLine = bodyReader.readLine()) != null) {
      body.append(bodyLine);
    }
    JsonObject bodyJson = new Gson().fromJson(body.toString(), JsonObject.class);
    String user = bodyJson.get("user").getAsString();
    String sender = bodyJson.get("sender").getAsString();
    Timestamp creationTime = new Timestamp(bodyJson.get("timestampMillis").getAsLong());
    System.out
        .println(String.format("[SERVER] -> received notification store request at: %s", creationTime.toString()));
    if (user == null || sender == null)
      throw new IOException("user and sender must be specified");
    return new NotificationUnpackDTO(user, sender, creationTime);
  }
}
