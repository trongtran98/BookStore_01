package app.controller.admin;

import app.DTO.ProducerDTO;
import app.controller.BaseController;
import app.helper.Helper;
import app.model.Producer;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/producers")
public class ProducersController extends BaseController {
    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("producers", producerService.findProducers());
        return "/admin/producers";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity deleteAuthor(@PathVariable Integer id) {
        return Helper.delete(id, producerService.delete(id));
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public @ResponseBody
    ProducerDTO findById(@PathVariable Integer id) {
        if (id == null)
            return null;
        ProducerDTO producerDTO = new ProducerDTO(producerService.findById(id));
        return producerDTO;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity createProducer(@RequestBody ProducerDTO producerDTO) {
        return createOrUpdate(producerDTO);
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity updateProducer(@RequestBody ProducerDTO producerDTO) {
        return createOrUpdate(producerDTO);
    }

    private ResponseEntity createOrUpdate(ProducerDTO producerDTO) {
        Producer producer = new Producer(producerDTO);
        return Helper.createOrUpdate(producer, producerService.saveOrUpdate(producer));
    }
}
