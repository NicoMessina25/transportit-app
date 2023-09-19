package com.funmesseg.transportit.api.shippingRequest;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import com.funmesseg.transportit.api.Response.CustomResponse;
import com.funmesseg.transportit.api.shippingRequest.dto.ShippingRequestRequest;
import com.funmesseg.transportit.api.user.dto.UserRequest;
import com.funmesseg.transportit.dao.shippingRequest.ShippingRequestDAO;
import com.funmesseg.transportit.dao.user.UserDAO;
import com.funmesseg.transportit.dao.user.UserRepository;
import com.funmesseg.transportit.model.ShippingRequest;
import com.funmesseg.transportit.model.User;

@Controller
public class ShippingRequestGQLController {
    @Autowired
    private ShippingRequestDAO shippingRequestDAO;

    @QueryMapping
    public List<ShippingRequest> shippingRequests(){
        return shippingRequestDAO.getShippingRequests();
    }

    @QueryMapping
    public ShippingRequest user(@Argument Long id){
        return shippingRequestDAO.getShippingRequestById(id);
    }

    @MutationMapping
    public CustomResponse saveShippingRequest(@Argument ShippingRequestRequest shippingRequestRequest){
        return shippingRequestDAO.saveShippingRequest(shippingRequestRequest);
    }

    @MutationMapping
    public CustomResponse updateShippingRequest(@Argument Long id, @Argument ShippingRequestRequest shippingRequestRequest){
        return shippingRequestDAO.updateShippingRequest(id, shippingRequestRequest);
    }

    @MutationMapping
    public CustomResponse deleteShippingRequest(@Argument Long id){
        return shippingRequestDAO.deleteShippingRequest(id);
    }
}
