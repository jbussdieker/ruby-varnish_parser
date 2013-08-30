backend backend_1 {
        .host = "1.2.3.4";
        .port = "9999";
        .first_byte_timeout = 20s;
        .probe = {
           .url = "/check";
           .interval = 5s;
           .timeout = 1s;
           .window = 5;
           .threshold = 3;
        }
}

backend backend_2 {
        .host = "5.6.7.8";
        .port = "10000";
        .first_byte_timeout = 20s;
        .probe = {
                .url = "/check";
                .interval = 5s;
                .timeout = 1s;
                .window = 5;
                .threshold = 3;
        }
}

director application_director round-robin {

    { .backend = backend_1; }

    { .backend = backend_2; }

}
