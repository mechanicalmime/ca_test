import React, { useState } from "react";
import { useForm } from "react-hook-form";
import { Form, FormGroup, Button } from 'reactstrap'
import Car from './Car'
import axios from 'axios';

function CarSearch() {
    const [cars, setCars] = useState([]);
    const [isLoading, setIsLoading] = useState(false);

    const { register, handleSubmit } = useForm();

    const searchCars = async (data) => {
        try {
            setIsLoading(true)

            const params = {}
            params[data.criteria] = data.query.toLowerCase()
            const response = await axios.get('http://localhost:4000/vehicles', { params: params })

            console.log(response.data)

            setCars(response.data)
        }
        catch (err) {
            console.log(err);
        }
        finally {
            setIsLoading(false);
        }
    }

    return (
        <div>
            <Form onSubmit={handleSubmit(searchCars)}>
                <div className="d-flex justify-content-center align-items-center w-full mt-4">
                    <FormGroup>
                        <input type="text" name="query" placeholder="Enter query" className="form-control" {...register("query")} />
                    </FormGroup>

                    <FormGroup>
                        <select type="select" name="criteria" className="form-control" {...register("criteria")}>
                            <option value="model_name">Model</option>
                            <option value="brand_name">Brand</option>
                            <option value="year">Year</option>
                            <option value="mileage">Mileage</option>
                            <option value="price">Price</option>
                        </select>
                    </FormGroup>

                    <FormGroup>
                        <Button type="submit" className="btn btn-success ml-3">Search Cars!</Button>
                    </FormGroup>
                </div>
            </Form>
            <div className="d-flex justify-content-center mt-5">
                {isLoading ?
                    <span>Loading...</span> :
                    cars.length <= 0 ?
                        <span>No Results</span> :
                        cars.map(car => <Car key={car.id} brand_name={car.brand_name} model_name={car.model_name} mileage={car.mileage} price={car.price} year={car.year}></Car>)
                }
            </div>
        </div>
    );
}

export default CarSearch;