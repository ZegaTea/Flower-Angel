/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import com.google.gson.reflect.TypeToken;
import java.util.ArrayList;
import java.util.List;
import model.*;
import util.Constants;
import util.Utils;

/**
 *
 * @author dovan
 */
public class StatusService {

    private Utils utils = new Utils();
    private final String pathApiClient = Constants.HOST_NAME_CLIENT + "status/";
    private final String pathApiAdmin = Constants.HOST_NAME_ADMIN + "status/";

    public List<Status> getListAll() {
        String api = pathApiAdmin + "list";
        TypeToken<List<Status>> token = new TypeToken<List<Status>>() {
        };
        List<Status> result = (ArrayList<Status>) utils.convertToObject(api, token);
        return result;
    }

    public Status getStatusById(int idS) {
        String api = pathApiAdmin + "get?id=" + idS;
        TypeToken<Status> token = new TypeToken<Status>() {
        };
        Status result = (Status) utils.convertToObject(api, token);
        return result;
    }

    public void addStatus(String name) {
        String api = pathApiAdmin + "modify?type=addnew&name" + name;
        utils.excutePost(api);
    }

    public void updateStatus(String name, int id) {
        String api = pathApiAdmin + "modify?type=update&name" + name + "&id=" + id;
        utils.excutePost(api);
    }
}
