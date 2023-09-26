package com.funmesseg.transportit.api.routeMap;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

import com.funmesseg.transportit.api.Response.CustomResponse;
import com.funmesseg.transportit.api.routeMap.dto.RouteMapRequest;
import com.funmesseg.transportit.dao.routeMap.RouteMapDAO;
import com.funmesseg.transportit.model.RouteMap;

@Controller
public class RouteMapGQLController {
    
    @Autowired
    private RouteMapDAO routeMapDAO;

    @QueryMapping
    public List<RouteMap> routeMaps(){
        return routeMapDAO.getRouteMaps();
    }

    @QueryMapping
    public RouteMap routeMap(@Argument Long routeMapId){
        return routeMapDAO.getRouteMapById(routeMapId);
    }

    @MutationMapping
    public CustomResponse saveRouteMap(@Argument RouteMapRequest routeMapRequest){
        return routeMapDAO.saveRouteMap(routeMapRequest);
    }

    @MutationMapping
    public CustomResponse updateRouteMap(@Argument RouteMapRequest routeMapRequest){
        return routeMapDAO.updateRouteMap(routeMapRequest);
        
    }

    @MutationMapping
    public CustomResponse deleteRouteMap(@Argument Long id){
        return routeMapDAO.deleteRouteMap(id);
    }
}
