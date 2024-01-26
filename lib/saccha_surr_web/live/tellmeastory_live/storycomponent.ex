defmodule SuchaaSurrWeb.TellmeastoryLive.Storycomponent do
  use SuchaaSurrWeb, :live_component

  def render(assigns) do
    ~H"""
    <div id="story-component" class="mt-3 text-left sm:mt-5 ">
      <div id="play-tampura" phx-hook="PlayTampura" >
      <div class="font-papyrus font-semibold text-center text-5xl text-gray-900 pb-5 ">Let there be Light</div>
        <p class="text-2xl text-center font-ayuthaya ">Moving from Darkness to Dawn</p>

         <div class="mt-10 prose text-xl leading-9 lg:prose-xl text-gray-700 font-ayuthaya">

          <p >How does one find a guru? I could think
            of only one way to get a definitive answer
            to this question. I had to ask my friend, the
            wise old musician, Bhaskar!</p>

            <p class="pt-6">Bhaskar was more than twice my age
            at that time. Even then, we had an easy
            and friendly relationship. Most times I
            would not have hesitated to call him my
            best friend. We talked about anything
            and everything.</p>


            <p class="pt-6">A few days later I met Bhaskar and asked him
            my question, “How does one find a Guru?”
            He looked at me very intently for a long time
            and then said, “You cannot!” took one of his
            very long pauses and continued, “The Guru
            finds you!”</p>

            <p class="pt-6">This was not the answer I was expecting.
            “Surely there is something one can do to find
            a guru?” feeling a little uncomfortable at the
            one-sidedness of the above statement.</p>

            <p class="pt-6">It looked like Bhaskar had lost interest in
            the question but he was merely lost in his
            thoughts. He came back and responded,
            “No, not really. The Guru finds you.”</p>

            <p class="pt-6">“I cannot accept that”, I said forcefully,
            “I have always found my own teachers…”</p>

            <p class="pt-6">“AHA!” he said, “Teachers! Yes, you can find
            your own teachers but the guru has to find
            you. There is no other way.”</p>

            <p class="pt-6">Now I was confused.</p>

            <p class="pt-6">“What is the difference between a teacher
            and a guru?” I asked.</p>

            <p class="pt-6">(Story continues in the full book...)</p>
        </div>
      </div>
    </div>
    """
  end
end
