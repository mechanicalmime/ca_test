import React from "react";
import { Card, CardImg, CardBody, CardTitle, CardSubtitle, Button } from 'reactstrap';

function Car(props) {
    const generateRandomColor = () => {
        var letters = '0123456789ABCDEF';
        var color = '';
        for (var i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }

        const color_url = `https://via.placeholder.com/150/${color}/FFFFFF`

        return color_url;
    }

    return (
        <div key={props.id}>
            <Card className="mr-4">
                <CardBody>
                    <CardImg top width="100%" src={generateRandomColor()} alt="Card image cap" />
                    <CardTitle tag="h5">️{props.model_name}</CardTitle>
                    <CardSubtitle tag="h6" className="mb-2 text-muted">{props.brand_name}</CardSubtitle>
                    <table className="table table-striped mt-3">
                        <tbody>
                            <tr>
                                <td>Price</td>
                                <td>{props.price}</td>
                            </tr>
                            <tr>
                                <td>Mileage</td>
                                <td>{props.mileage}</td>
                            </tr>
                            <tr>
                                <td>Year</td>
                                <td>{props.year}</td>
                            </tr>
                        </tbody>
                    </table>
                    <Button className="btn btn-danger">Comprar</Button>
                </CardBody>
            </Card>
        </div>
    );
}

export default Car;
