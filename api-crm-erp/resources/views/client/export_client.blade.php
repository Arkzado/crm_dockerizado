<table>
    <thead>
        <tr>
            <th>#</th>
            <th width="45">Nombre Completo/Razon Social</th>
            <th width="15">Tipo de documento</th>
            <th width="15">N° de documento</th>
            <th width="20">Segmento de cliente</th>
            <th width="15">Telefono</th>
            <th width="20">Correo electronico</th>
            <th width="15">Origen</th>
            <th width="20">Departamento</th>
            <th width="20">Municipio</th>
            <th width="20">Asesor</th>
            <th width="35">Dirección</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($clients as $key => $client)
            <tr>
                <td>{{ $key + 1 }}</td>
                <td>{{ $client->full_name }}</td>
                <td>{{ $client->type_document }}</td>
                <td>{{ $client->n_document }}</td>
                <td>{{ $client->client_segment->name }}</td>
                <td>{{ $client->phone }}</td>
                <td>{{ $client->email }}</td>
                <td>{{ $client->origen }}</td>
                <td>{{ $client->departamento }}</td>
                <td>{{ $client->municipio }}</td>
                <td>{{ $client->asesor?->name ? $client->asesor->name . ' ' . $client->asesor->surname : 'N/A' }}</td>
                <td>{{ $client->address }}</td>
            </tr>
        @endforeach
    </tbody>
</table>