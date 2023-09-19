package com.funmesseg.transportit.api.shippingRequest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

import com.funmesseg.transportit.api.Response.CustomResponse;
import com.funmesseg.transportit.api.shippingRequest.dto.ShippingRequestRequest;
import com.funmesseg.transportit.dao.shippingRequest.ShippingRequestDAO;
import com.funmesseg.transportit.model.ShippingRequest;

@Controller
public class ShippingRequestGQLController {
    @Autowired
    private ShippingRequestDAO shippingRequestDAO;

    @QueryMapping
    public List<ShippingRequest> shippingRequests(){
        return shippingRequestDAO.getShippingRequests();
    }

    @QueryMapping
    public ShippingRequest shippingRequest(@Argument Long id){
        return shippingRequestDAO.getShippingRequestById(id);
    }

    @MutationMapping
    public CustomResponse saveShippingRequest(@Argument ShippingRequestRequest shippingRequestRequest){
        return shippingRequestDAO.saveShippingRequest(shippingRequestRequest);
    }

    @MutationMapping
    public CustomResponse updateShippingRequest(@Argument ShippingRequestRequest shippingRequestRequest){
        return shippingRequestDAO.updateShippingRequest(shippingRequestRequest);
    }

    @MutationMapping
    public CustomResponse deleteShippingRequest(@Argument Long id){
        return shippingRequestDAO.deleteShippingRequest(id);
    }
}
