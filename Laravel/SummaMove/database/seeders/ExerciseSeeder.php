<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon as carbon;

class ExerciseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // DB::table('exercises')->truncate();
        DB::table('exercises')->insert([
            'name' => "Squat",
            'description_en' => "
                Step 1
                First, stand with your legs wider than your hips.
                
                Step 2
                Then, point your toes forward.
                
                Step 3
                Next, extend your arms in front of you while slowly lowering your body until your knees are at a 90-degree angle.
                
                Step 4
                Finally, make sure your heels and toes remain in contact with the ground.",
            'description_nl' => "
                Stap 1
                Eerst, sta met je benen wijder dan je heupen.
                
                Stap 2
                Daarna, wijs met je tenen naar voren.
                
                Stap 3
                Vervolgens, strek je armen voor je uit terwijl je langzaam je lichaam laat zakken tot je knieën een hoek van 90 graden hebben.
                
                Stap 4
                Tot slot, zorg ervoor dat je hielen en tenen contact houden met de grond.",
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);
        
        DB::table('exercises')->insert([
            'name' => "Push-up",
            'description_en' => "
                Step 1
                First, start in a plank position with your hands slightly wider than shoulder-width apart.
                
                Step 2
                Then, lower your body by bending your elbows, keeping your back straight and your core engaged.
                
                Step 3
                Next, push yourself back up to the starting position by extending your arms.
                
                Step 4
                Finally, repeat the movement for the desired number of repetitions.",
            'description_nl' => "
                Stap 1
                Eerst, begin in een plankpositie met je handen iets breder dan schouderbreedte uit elkaar.
                
                Stap 2
                Daarna, laat je lichaam zakken door je ellebogen te buigen, terwijl je je rug recht houdt en je core aanspant.
                
                Stap 3
                Vervolgens, duw jezelf weer omhoog naar de startpositie door je armen te strekken.
                
                Stap 4
                Tot slot, herhaal de beweging voor het gewenste aantal herhalingen.",
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);


        DB::table('exercises')->insert([
            'name' => "Dip",
            'description_en' => "
                Step 1
                First, position yourself on parallel bars with your arms extended and supporting your body weight.
                
                Step 2
                Then, lower your body by bending your elbows until your shoulders are below your elbows.
                
                Step 3
                Next, push yourself back up by straightening your arms to the starting position.
                
                Step 4
                Finally, repeat the exercise for the desired number of repetitions.",
            'description_nl' => "
                Stap 1
                Eerst, plaats jezelf op parallelle stangen met je armen gestrekt en je lichaamsgewicht ondersteunend.
                
                Stap 2
                Daarna, verlaag je je lichaam door je ellebogen te buigen totdat je schouders onder je ellebogen zijn.
                
                Stap 3
                Vervolgens, duw je jezelf omhoog door je armen te strekken naar de startpositie.
                
                Stap 4
                Tot slot, herhaal de oefening voor het gewenste aantal herhalingen.",
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);
    
        DB::table('exercises')->insert([
            'name' => "Plank",
            'description_en' => "
                Step 1
                First, position yourself face down on the floor, supporting your weight on your forearms and toes.
                
                Step 2
                Then, align your elbows directly under your shoulders and maintain a straight line from head to toe.
                
                Step 3
                Next, engage your core and hold this position for the desired duration.
                
                Step 4
                Finally, release the position and rest.",
            'description_nl' => "
                Stap 1
                Eerst, positioneer jezelf met je gezicht naar beneden op de grond, waarbij je je gewicht ondersteunt op je onderarmen en tenen.
                
                Stap 2
                Daarna, plaats je ellebogen recht onder je schouders en behoud je een rechte lijn van je hoofd tot aan je tenen.
                
                Stap 3
                Vervolgens, span je je core aan en houd je deze positie vast gedurende de gewenste tijd.
                
                Stap 4
                Tot slot, laat de positie los en rust uit.",
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);
    
        DB::table('exercises')->insert([
            'name' => "Paardentrap",
            'description_en' => "
                Step 1
                First, stand with your feet wider than your hips and your hands on your hips.
                
                Step 2
                Then, take a large step to the side with your right foot, lowering your body until your right knee is at a 90-degree angle.
                
                Step 3
                Next, push off with your right foot and return to the starting position.
                
                Step 4
                Finally, repeat the same steps with your left foot.",
            'description_nl' => "
                Stap 1
                Eerst, sta met je voeten wijder dan je heupen en je handen op je heupen.
                
                Stap 2
                Daarna, maak een grote stap opzij met je rechtervoet, waarbij je je lichaam laat zakken totdat je rechterknie een hoek van 90 graden heeft.
                
                Stap 3
                Vervolgens, duw je jezelf af met je rechtervoet en keer je terug naar de startpositie.
                
                Stap 4
                Tot slot, herhaal dezelfde stappen met je linkervoet.",
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);

        
        DB::table('exercises')->insert([
            'name' => "Mountain Climber",
            'description_en' => "
                Step 1
                First, start in a plank position with your hands directly under your shoulders.
                
                Step 2
                Then, drive one knee toward your chest while keeping your core engaged and your hips level.
                
                Step 3
                Next, return that leg to the starting position while simultaneously driving the other knee toward your chest.
                
                Step 4
                Finally, continue alternating legs in a rhythmic motion, as if you're running in place.",
            'description_nl' => "
                Stap 1
                Eerst, begin in een plankpositie met je handen recht onder je schouders.
                
                Stap 2
                Daarna, breng één knie naar je borst terwijl je je core aanspant en je heupen op gelijke hoogte houdt.
                
                Stap 3
                Vervolgens, breng je dat been terug naar de startpositie terwijl je tegelijkertijd de andere knie naar je borst brengt.
                
                Stap 4
                Tot slot, wissel je afwisselend van been in een ritmische beweging, alsof je op dezelfde plek aan het rennen bent.",
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);


        DB::table('exercises')->insert([
            'name' => "Burpee",
            'description_en' => "
                Step 1
                First, stand with your feet shoulder-width apart.
                
                Step 2
                Then, lower your body into a squat position with your hands on the floor in front of you.
                
                Step 3
                Next, kick your feet back to a push-up position and immediately return them to the squat position.
                
                Step 4
                Finally, jump up into the air as high as you can before returning to the starting position and repeating the exercise.",
            'description_nl' => "
                Stap 1
                Eerst, sta met je voeten op schouderbreedte uit elkaar.
                
                Stap 2
                Daarna, zak door je knieën en plaats je handen op de grond voor je.
                
                Stap 3
                Vervolgens, strek je benen naar achteren uit naar de push-up positie en breng ze direct weer terug naar de squat positie.
                
                Stap 4
                Tot slot, spring zo hoog mogelijk omhoog voordat je terugkeert naar de startpositie en herhaal de oefening.",
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);

        DB::table('exercises')->insert([
            'name' => "Lunge",
            'description_en' => "
                Step 1
                First, stand with your feet hip-width apart and your hands on your hips.
                
                Step 2
                Then, take a big step forward with your right foot, lowering your body until your right knee is at a 90-degree angle.
                
                Step 3
                Next, push off with your right foot and return to the starting position.
                
                Step 4
                Finally, repeat the same steps with your left foot.",
            'description_nl' => "
                Stap 1
                Eerst, sta met je voeten op heupbreedte en je handen op je heupen.
                
                Stap 2
                Daarna, maak een grote stap naar voren met je rechtervoet, waarbij je je lichaam laat zakken tot je rechterknie een hoek van 90 graden heeft.
                
                Stap 3
                Vervolgens, duw je jezelf omhoog met je rechtervoet en keer je terug naar de startpositie.
                
                Stap 4
                Tot slot, herhaal dezelfde stappen met je linkervoet.",
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);

        DB::table('exercises')->insert([
            'name' => "Wall Sit",
            'description_en' => "
                Step 1
                First, stand with your back against a wall and your feet shoulder-width apart.
                
                Step 2
                Then, slide your back down the wall while bending your knees until they are at a 90-degree angle.
                
                Step 3
                Next, make sure your thighs are parallel to the ground and your knees are directly above your ankles.
                
                Step 4
                Finally, hold this position for the desired amount of time, keeping your core engaged and your back flat against the wall.",
            'description_nl' => "
                Stap 1
                Eerst, ga met je rug tegen een muur staan en je voeten op schouderbreedte uit elkaar.
                
                Stap 2
                Daarna, glijd met je rug langs de muur omlaag terwijl je je knieën buigt tot een hoek van 90 graden.
                
                Stap 3
                Vervolgens, zorg ervoor dat je dijen parallel aan de grond zijn en je knieën recht boven je enkels staan.
                
                Stap 4
                Tot slot, houd deze positie vast voor de gewenste tijd, waarbij je je core aangespannen houdt en je rug plat tegen de muur.",
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);

        
        DB::table('exercises')->insert([
            'name' => "Crunch",
            'description_en' => "
                Step 1
                First, lie on your back with your knees bent and your feet flat on the ground.
                
                Step 2
                Then, place your hands behind your head or across your chest.
                
                Step 3
                Next, engage your core muscles and lift your head, neck, and shoulders off the ground.
                
                Step 4
                Finally, lower yourself back down to the starting position while maintaining control.",
            'description_nl' => "
                Stap 1
                Eerst, ga op je rug liggen met je knieën gebogen en je voeten plat op de grond.
                
                Stap 2
                Daarna, plaats je handen achter je hoofd of over je borst.
                
                Stap 3
                Vervolgens, span je buikspieren aan en til je je hoofd, nek en schouders van de grond.
                
                Stap 4
                Tot slot, laat jezelf gecontroleerd terugzakken naar de startpositie.",
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);
    }
}