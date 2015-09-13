<?php

class ProfTest extends TestCase
{


    public function test_add_prof()
    {


        $response = $this->call('POST', 'add_prof',
            array(

                'name' => "hassan",
                'Address' => "fgdfgdfsfsdddfsadsadassddsadgdfgdfg",
                'date' => "04/08/2015",
                'Phone' => "01785w22dsdasdaewqewe555",
                'Mail' => "Hs8-a587dasdasdsa7dasdasddscdfaadsl"

            ));

        $this->assertSessionHas('success');
    }

    public function test_delete_Prof()
    {
        $response = $this->call('GET', 'delete_prof={id}');

        $this->assertSessionHas('success');
    }

    public function test_view_prof()
    {
        $crawler = $this->client->request('GET', 'view_prof');

        $this->assertTrue($this->client->getResponse()->isOk());
    }
}